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
        public virtual DbSet<Invoice> Invoices { get; set; } = null!;
        public virtual DbSet<Material> Materials { get; set; } = null!;
        public virtual DbSet<MedicalRecord> MedicalRecords { get; set; } = null!;
        public virtual DbSet<Medicine> Medicines { get; set; } = null!;
        public virtual DbSet<News> News { get; set; } = null!;
        public virtual DbSet<Prescription> Prescriptions { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Service> Services { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server=localhost; database= dental; uid=sa; password=12;Trusted_Connection=True;TrustServerCertificate=True");
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

                entity.Property(e => e.EmployeeId).HasColumnName("employee_id");

                entity.Property(e => e.Note)
                    .HasMaxLength(100)
                    .HasColumnName("note");

                entity.Property(e => e.PatientId).HasColumnName("patient_id");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.AppointmentEmployees)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Appointment_User");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.AppointmentPatients)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_Appointment_User1");
            });

            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.ToTable("Invoice");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AppointmentId).HasColumnName("appointmentId");

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
                entity.HasKey(e => e.RecordId);

                entity.ToTable("MedicalRecord");

                entity.Property(e => e.RecordId).HasColumnName("recordId");

                entity.Property(e => e.AppointmentId).HasColumnName("appointmentId");

                entity.Property(e => e.Diagnosis)
                    .HasMaxLength(50)
                    .HasColumnName("diagnosis");

                entity.Property(e => e.PatientId).HasColumnName("patientId");

                entity.Property(e => e.PrescriptionId).HasColumnName("prescriptionId");

                entity.Property(e => e.ServiceId).HasColumnName("serviceId");

                entity.HasOne(d => d.Appointment)
                    .WithMany(p => p.MedicalRecords)
                    .HasForeignKey(d => d.AppointmentId)
                    .HasConstraintName("FK_MedicalRecord_Appointment");

                entity.HasOne(d => d.Patient)
                    .WithMany(p => p.MedicalRecords)
                    .HasForeignKey(d => d.PatientId)
                    .HasConstraintName("FK_MedicalRecord_User");

                entity.HasOne(d => d.Prescription)
                    .WithMany(p => p.MedicalRecords)
                    .HasForeignKey(d => d.PrescriptionId)
                    .HasConstraintName("FK_MedicalRecord_Prescription");

                entity.HasOne(d => d.Service)
                    .WithMany(p => p.MedicalRecords)
                    .HasForeignKey(d => d.ServiceId)
                    .HasConstraintName("FK_MedicalRecord_Service");
            });

            modelBuilder.Entity<Medicine>(entity =>
            {
                entity.ToTable("Medicine");

                entity.Property(e => e.Id).HasColumnName("id");

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
                    .HasMaxLength(50)
                    .HasColumnName("brief_info");

                entity.Property(e => e.CreatedAt)
                    .HasColumnType("date")
                    .HasColumnName("created_at");

                entity.Property(e => e.Description)
                    .HasColumnType("text")
                    .HasColumnName("description");

                entity.Property(e => e.Tittle)
                    .HasMaxLength(50)
                    .HasColumnName("tittle");
            });

            modelBuilder.Entity<Prescription>(entity =>
            {
                entity.ToTable("Prescription");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.DosageInstruction)
                    .HasMaxLength(50)
                    .HasColumnName("dosageInstruction");

                entity.Property(e => e.MedicineId).HasColumnName("medicineId");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.HasOne(d => d.Medicine)
                    .WithMany(p => p.Prescriptions)
                    .HasForeignKey(d => d.MedicineId)
                    .HasConstraintName("FK_Prescription_Medicine");
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
