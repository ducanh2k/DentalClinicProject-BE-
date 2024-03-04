using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DentalClinicProject.Models
{
    public partial class dentalContext : DbContext
    {
        public dentalContext()
        {
        }

        public dentalContext(DbContextOptions<dentalContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Appointment> Appointments { get; set; } = null!;
        public virtual DbSet<AreasOfExpertise> AreasOfExpertises { get; set; } = null!;
        public virtual DbSet<Comment> Comments { get; set; } = null!;
        public virtual DbSet<Degree> Degrees { get; set; } = null!;
        public virtual DbSet<ForeignLanguage> ForeignLanguages { get; set; } = null!;
        public virtual DbSet<Invoice> Invoices { get; set; } = null!;
        public virtual DbSet<Material> Materials { get; set; } = null!;
        public virtual DbSet<MedicalRecord> MedicalRecords { get; set; } = null!;
        public virtual DbSet<MedicalRecordDetail> MedicalRecordDetails { get; set; } = null!;
        public virtual DbSet<Medicine> Medicines { get; set; } = null!;
        public virtual DbSet<News> News { get; set; } = null!;
        public virtual DbSet<ParticipatingTrainingCourse> ParticipatingTrainingCourses { get; set; } = null!;
        public virtual DbSet<Prescription> Prescriptions { get; set; } = null!;
        public virtual DbSet<PrescriptionDetail> PrescriptionDetails { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Service> Services { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server =(local); database = dental;uid=sa;pwd=123;TrustServerCertificate=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Appointment>(entity =>
            {
                entity.ToTable("Appointment");

                entity.Property(e => e.AppointmentId).HasColumnName("appointment_id");

                entity.Property(e => e.Datetime)
                    .HasColumnType("date")
                    .HasColumnName("datetime");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.DoctorId).HasColumnName("doctor_id");

                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");

                entity.Property(e => e.Note)
                    .HasMaxLength(100)
                    .HasColumnName("note");

                entity.Property(e => e.PatientId).HasColumnName("patient_id");

                entity.Property(e => e.Status)
                    .HasMaxLength(50)
                    .HasColumnName("status");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.AppointmentDoctors)
                    .HasForeignKey(d => d.DoctorId)
                    .HasConstraintName("FK_Appointment_User2");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.AppointmentEmployees)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Appointment_User");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.AppointmentPatients)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_Appointment_User1");
            });

            modelBuilder.Entity<AreasOfExpertise>(entity =>
            {
                entity.ToTable("Areas_of_expertise");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Detail).HasColumnName("detail");

                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.AreasOfExpertises)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Areas_of_expertise_User");
            });

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.ToTable("comment");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CommentDetail).HasColumnName("commentDetail");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.PatientId).HasColumnName("patient_id");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Comments)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_comment_User");
            });

            modelBuilder.Entity<Degree>(entity =>
            {
                entity.ToTable("Degree");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Detail).HasColumnName("detail");

                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Degrees)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Degree_User");
            });

            modelBuilder.Entity<ForeignLanguage>(entity =>
            {
                entity.ToTable("Foreign_Language");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Detail).HasColumnName("detail");

                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.ForeignLanguages)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Foreign_Language_User");
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.ToTable("Invoice");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AppointmentId).HasColumnName("appointmentId");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Discount).HasColumnName("discount");

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.Property(e => e.PrescriptionId).HasColumnName("prescriptionId");

                entity.HasOne(d => d.Appointment)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.AppointmentId)
                    .HasConstraintName("FK_Invoice_Appointment");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_Invoice_User");

                entity.HasOne(d => d.Prescription)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.PrescriptionId)
                    .HasConstraintName("FK_Invoice_Prescription");
            });

            modelBuilder.Entity<Material>(entity =>
            {
                entity.ToTable("Material");

                entity.Property(e => e.MaterialId).HasColumnName("material_id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.MaterialName)
                    .HasMaxLength(50)
                    .HasColumnName("material_name");

                entity.Property(e => e.QuantityInStock).HasColumnName("quantityInStock");

                entity.Property(e => e.Supplier)
                    .HasMaxLength(50)
                    .HasColumnName("supplier");

                entity.Property(e => e.UnitPrice).HasColumnName("unitPrice");
            });

            modelBuilder.Entity<MedicalRecord>(entity =>
            {
                entity.ToTable("MedicalRecord");

                entity.Property(e => e.MedicalRecordId).HasColumnName("medicalRecordId");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.MedicalRecords)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_MedicalRecord_User");
            });

            modelBuilder.Entity<MedicalRecordDetail>(entity =>
            {
                entity.HasKey(e => e.MrDetailId);

                entity.ToTable("MedicalRecord Details");

                entity.Property(e => e.MrDetailId).HasColumnName("mr_detail_id");

                entity.Property(e => e.AppointmentId).HasColumnName("appointment_id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Diagnosis)
                    .HasMaxLength(500)
                    .HasColumnName("diagnosis");

                entity.Property(e => e.MedicalRecordId).HasColumnName("medicalRecord_id");

                entity.Property(e => e.PrescriptionId).HasColumnName("prescription_id");

                entity.Property(e => e.ServiceId).HasColumnName("service_id");

                entity.HasOne(d => d.Appointment)
                    .WithMany(p => p.MedicalRecordDetails)
                    .HasForeignKey(d => d.AppointmentId)
                    .HasConstraintName("FK_MedicalRecord Details_Appointment");

                entity.HasOne(d => d.MedicalRecord)
                    .WithMany(p => p.MedicalRecordDetails)
                    .HasForeignKey(d => d.MedicalRecordId)
                    .HasConstraintName("FK_MedicalRecord Details_MedicalRecord");

                entity.HasOne(d => d.Prescription)
                    .WithMany(p => p.MedicalRecordDetails)
                    .HasForeignKey(d => d.PrescriptionId)
                    .HasConstraintName("FK_MedicalRecord Details_Prescription");

                entity.HasOne(d => d.Service)
                    .WithMany(p => p.MedicalRecordDetails)
                    .HasForeignKey(d => d.ServiceId)
                    .HasConstraintName("FK_MedicalRecord Details_Service");
            });

            modelBuilder.Entity<Medicine>(entity =>
            {
                entity.ToTable("Medicine");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Description)
                    .HasMaxLength(100)
                    .HasColumnName("description");

                entity.Property(e => e.Dosage)
                    .HasMaxLength(50)
                    .HasColumnName("dosage");

                entity.Property(e => e.ExpiryDate)
                    .HasColumnType("date")
                    .HasColumnName("expiry_date");

                entity.Property(e => e.InputDay)
                    .HasColumnType("date")
                    .HasColumnName("input_day");

                entity.Property(e => e.Manufacturer)
                    .HasMaxLength(50)
                    .HasColumnName("manufacturer");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.QuantityInStock).HasColumnName("quantityInStock");
            });

            modelBuilder.Entity<News>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Author).HasColumnName("author");

                entity.Property(e => e.BriefInfo)
                    .HasColumnType("text")
                    .HasColumnName("brief_info");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("date")
                    .HasColumnName("created_at");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Description)
                    .HasColumnType("text")
                    .HasColumnName("description");

                entity.Property(e => e.Featured).HasColumnName("featured");

                entity.Property(e => e.Tittle)
                    .HasColumnType("text")
                    .HasColumnName("tittle");

                entity.HasOne(d => d.AuthorNavigation)
                    .WithMany(p => p.News)
                    .HasForeignKey(d => d.Author)
                    .HasConstraintName("FK_News_User");
            });

            modelBuilder.Entity<ParticipatingTrainingCourse>(entity =>
            {
                entity.ToTable("Participating_training_courses");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Detail).HasColumnName("detail");

                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.ParticipatingTrainingCourses)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Participating_training_courses_User");
            });

            modelBuilder.Entity<Prescription>(entity =>
            {
                entity.ToTable("Prescription");

                entity.Property(e => e.PrescriptionId).HasColumnName("prescription_id");

                entity.Property(e => e.CreatedDate)
                    .HasColumnType("datetime")
                    .HasColumnName("created_date");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.DoctorId).HasColumnName("doctor_id");

                entity.Property(e => e.Note)
                    .HasMaxLength(1000)
                    .HasColumnName("note");

                entity.HasOne(d => d.Doctor)
                    .WithMany(p => p.Prescriptions)
                    .HasForeignKey(d => d.DoctorId)
                    .HasConstraintName("FK_Prescription_User");
            });

            modelBuilder.Entity<PrescriptionDetail>(entity =>
            {
                entity.ToTable("Prescription Details");

                entity.Property(e => e.PrescriptionDetailId).HasColumnName("prescriptionDetail_id");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.DosageInstruction)
                    .HasMaxLength(1000)
                    .HasColumnName("dosageInstruction");

                entity.Property(e => e.MedicineId).HasColumnName("medicineId");

                entity.Property(e => e.PrescriptionId).HasColumnName("prescription_id");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.Medicine)
                    .WithMany(p => p.PrescriptionDetails)
                    .HasForeignKey(d => d.MedicineId)
                    .HasConstraintName("FK_Prescription Details_Medicine");

                entity.HasOne(d => d.Prescription)
                    .WithMany(p => p.PrescriptionDetails)
                    .HasForeignKey(d => d.PrescriptionId)
                    .HasConstraintName("FK_Prescription Details_Prescription");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Name)
                    .HasMaxLength(10)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Service>(entity =>
            {
                entity.ToTable("Service");

                entity.Property(e => e.ServiceId).HasColumnName("service_id");

                entity.Property(e => e.BriefInfo)
                    .HasMaxLength(50)
                    .HasColumnName("brief_info");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Description)
                    .HasMaxLength(100)
                    .HasColumnName("description");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.ServiceName)
                    .HasMaxLength(50)
                    .HasColumnName("service_name");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.DateCreated)
                    .HasColumnType("date")
                    .HasColumnName("date_created");

                entity.Property(e => e.DeleteFlag).HasColumnName("delete_flag");

                entity.Property(e => e.Description)
                    .HasColumnType("text")
                    .HasColumnName("description");

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .HasColumnName("email");

                entity.Property(e => e.Img)
                    .HasMaxLength(50)
                    .HasColumnName("img");

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .HasColumnName("name");

                entity.Property(e => e.Password)
                    .HasMaxLength(50)
                    .HasColumnName("password")
                    .IsFixedLength();

                entity.Property(e => e.Phone)
                    .HasMaxLength(11)
                    .HasColumnName("phone")
                    .IsFixedLength();

                entity.Property(e => e.Role).HasColumnName("role");

                entity.Property(e => e.Salary).HasColumnName("salary");

                entity.HasOne(d => d.RoleNavigation)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.Role)
                    .HasConstraintName("FK_User_Role");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
