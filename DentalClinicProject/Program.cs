using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using DentalClinicProject.Services.UserService;
using Microsoft.AspNetCore.Authentication.JwtBearer;
<<<<<<< HEAD
using Microsoft.AspNetCore.Authorization;
=======
>>>>>>> bf14b894a4f01b73cedac5937e15197027dd69d2
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

using Newtonsoft.Json.Serialization;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IUserService, UserService>();
builder.Services.AddHttpContextAccessor();
builder.Services.AddAutoMapper(typeof(MyMapperProfile));
builder.Services.AddDbContext<dentalContext>(
    option => option.UseSqlServer(builder.Configuration.GetConnectionString("MyDB")));

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
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
    var builder = new AuthorizationPolicyBuilder();
    builder.AuthenticationSchemes.Add(JwtBearerDefaults.AuthenticationScheme);
    builder.RequireAuthenticatedUser();
    opt.DefaultPolicy = builder.Build();
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
app.Run();
