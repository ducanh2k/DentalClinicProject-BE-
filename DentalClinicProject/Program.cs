using Azure.Core;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.Implement;
using DentalClinicProject.Services.Interface;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

using Newtonsoft.Json.Serialization;
using System.Text;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


// Config Denfency Injection
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddScoped<IInvoiceService, InvoiceService>();
builder.Services.AddScoped<IAppointmentService, AppointmentService>();
builder.Services.AddScoped<ICommentService, CommentService>();
builder.Services.AddScoped<IMaterialService, MaterialService>();
builder.Services.AddScoped<IMedicineService, MedicineService>();
builder.Services.AddScoped<INewsService, NewsService>();
builder.Services.AddScoped<IServiceService, ServiceService>();
builder.Services.AddScoped<IMedicalRecordService, MedicalRecordService>();
builder.Services.AddScoped<IMedicalRecordDetailService, MedicalRecordDetailService>();
builder.Services.AddScoped<IPrescriptionService, PrescriptionService>();
builder.Services.AddScoped<IPrescriptionDetailService, PrescriptionDetailService>();

builder.Services.AddHttpContextAccessor();
//Config automapper
builder.Services.AddAutoMapper(typeof(MyMapperProfile));

//Config db
builder.Services.AddDbContext<dentalContext>(
    option => option.UseSqlServer(builder.Configuration.GetConnectionString("MyDB")));

builder.Services.AddControllers()
        .AddJsonOptions(options =>
        {
            options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
        });

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

})

// Adding Jwt Bearer  
    .AddJwtBearer(options =>
    {
         options.SaveToken = true;
         options.RequireHttpsMetadata = false;
         options.TokenValidationParameters = new TokenValidationParameters()
         {
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidAudience = builder.Configuration["JWT:ValidAudience"],
            ValidIssuer = builder.Configuration["JWT:ValidIssuer"],
            ClockSkew = TimeSpan.Zero,
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["JWT:Secret"]))
     };
});

builder.Services.AddAuthorization(opt =>
{
    opt.DefaultPolicy = new AuthorizationPolicyBuilder()
            .AddAuthenticationSchemes(JwtBearerDefaults.AuthenticationScheme)
            .RequireAuthenticatedUser()
            .Build();
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();
app.UseAuthentication();
app.MapControllers();
app.UseCors(x => x
           .AllowAnyMethod()
           .AllowAnyHeader()
           .AllowCredentials()
           .SetIsOriginAllowed(origin => true));

 static void InsertAdmin(IServiceProvider services, WebApplicationBuilder? builder)
{
    using var scope = services.CreateScope();
    var serviceProvider = scope.ServiceProvider;

    try
    {
        var context = serviceProvider.GetRequiredService<dentalContext>();


        var admin = new User();
        var email = builder.Configuration["Admin:Email"];
        var pass = builder.Configuration["Admin:Password"];

        admin = context.Users.Include(u => u.RoleNavigation)
                .FirstOrDefault(o => o.Email == email);

        if (admin == null || admin.Email != email)
        {

            admin = new User
            {
                Email = email,
                Name = "dental",
                Role = 1
            };

            admin.CreatePasswordHash(pass);

            context.Users.Add(admin);
            context.SaveChanges();
        }
    }
    catch (Exception ex)
    {
        var logger = serviceProvider.GetRequiredService<ILogger<Program>>();
        logger.LogError(ex, "An error occurred while inserting admin into the database.");
    }
}

InsertAdmin(app.Services, builder);



app.Run();
