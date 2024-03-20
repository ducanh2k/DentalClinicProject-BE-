using AutoMapper;
using DentalClinicProject.DTO;
using DentalClinicProject.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace DentalClinicProject.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DashboardController : Controller
    {
        private readonly dentalContext _context;
        
        public DashboardController(dentalContext context)
        {
            _context = context;
        }
        static DateTime dateTime = DateTime.Now;
        static int CurrentMonth = dateTime.Month;
        static int CurrentYear = dateTime.Year;

        // Revenue from service, material which used 
        [HttpGet("revenue")]
        public IActionResult GetRevenue(int year) 
        {
            try
            {
                var query = (from il in _context.InvoiceLines
                             join inv in _context.Invoices on il.InvoiceId equals inv.InvoiceId into invJoin
                             from inv in invJoin.DefaultIfEmpty()
                             join s in _context.Services on il.ServiceId equals s.ServiceId into sJoin
                             from s in sJoin.DefaultIfEmpty()
                             where inv != null && inv.Status == 2 && inv.Date.Value.Year == year
                             select new
                             {
                                 Year = inv.Date.Value.Year,
                                 Month = inv.Date.Value.Month,
                                 TotalPay = (s.Price ?? 0) 
                             }).ToList();

                var result = query.GroupBy(x => new { x.Year, x.Month })
                                  .Select(g => new
                                  {
                                      Year = g.Key.Year,
                                      Month = g.Key.Month,
                                      TotalPayOfMonth = g.Sum(x => x.TotalPay)
                                  })
                                  .OrderBy(x => x.Month)
                                  .ToList<object>();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // Doanh thu 1 thang
        [HttpGet("revenueInMonth")]
        public IActionResult GetRevenueInMonth()
        {
            try
            {
                var query = from invLine in _context.InvoiceLines
                            join inv in _context.Invoices on invLine.InvoiceId equals inv.InvoiceId into invGroup
                            from inv in invGroup.DefaultIfEmpty()
                            join service in _context.Services on invLine.ServiceId equals service.ServiceId into serviceGroup
                            from service in serviceGroup.DefaultIfEmpty()
                            where inv.Date.Value.Year == CurrentYear && inv.Date.Value.Month == CurrentMonth && inv.Status == 2
                            select new
                            {
                                Year = inv.Date.Value.Year,
                                Month = inv.Date.Value.Month,
                                Day = inv.Date.Value.Day,
                                TotalPay = (service.Price ?? 0) 
                            }
                        into subquery
                            group subquery by new { subquery.Year, subquery.Month, subquery.Day } into g
                            select new
                            {
                                Year = g.Key.Year,
                                Month = g.Key.Month,
                                Day = g.Key.Day,
                                TotalPayOfDay = g.Sum(x => x.TotalPay)
                            };

                return Ok(query);
            }
            catch(Exception ex) { 
            return BadRequest(ex.Message);
            }
        }
        // So benh nhan da phuc vu 1 thang, 1 nam
        [HttpGet("patient")]
        public IActionResult GetPatient(int month, int year) // month = 0 then count patient in all year
        {
            try
            {
                var query = _context.Appointments.AsQueryable();

                if (month == 0)
                {
                    var result = query
                        .Where(a => a.Datetime.Value.Year == year)
                        .GroupBy(a => new { Month = a.Datetime.Value.Month, Year = a.Datetime.Value.Year })
                        .Select(g => new
                        {
                            TotalPatientsPerMonth = g.Count(),
                            Month = g.Key.Month,
                            Year = g.Key.Year
                        })
                        .ToList();

                    return Ok(result);
                }
                else
                {
                    var result = query
                        .Where(a => a.Datetime.Value.Month == month && a.Datetime.Value.Year == year)
                        .GroupBy(a => new { Month = a.Datetime.Value.Month, Year = a.Datetime.Value.Year })
                        .Select(g => new
                        {
                            TotalPatientsPerMonth = g.Count(),
                            Month = g.Key.Month,
                            Year = g.Key.Year
                        })
                        .ToList();

                    return Ok(result);
                }
            }catch(Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        // Dich vu dc dung nhieu nhat trong nam
        [HttpGet("service")]
        public IActionResult GetService(int month, int year) // month = 0 mean service in all year
        {
            try
            {
                var query = _context.InvoiceLines
            .Join(_context.Invoices, il => il.InvoiceId, i => i.InvoiceId, (il, i) => new { il, i }).AsQueryable();
                if (month == 0)
                {
                    var result = query
                            .Where(x => x.i.Date.Value.Year == year)
                            .GroupBy(x => new { Month = x.i.Date.Value.Month, Year = x.i.Date.Value.Year, ServiceId = x.il.ServiceId })
                            .Select(g => new
                            {
                                ServiceId = g.Key.ServiceId,
                                UsageCount = g.Count(),
                                Month = g.Key.Month,
                                Year = g.Key.Year
                            })
                            .ToList();
                    return Ok(result);
                }
                else
                {
                    var result = query
                        .Where(x => x.i.Date.Value.Month == month && x.i.Date.Value.Year == year)
                        .GroupBy(x => new { Month = x.i.Date.Value.Month, Year = x.i.Date.Value.Year, ServiceId = x.il.ServiceId })
                        .Select(g => new
                        {
                            ServiceId = g.Key.ServiceId,
                            UsageCount = g.Count(),
                            Month = g.Key.Month,
                            Year = g.Key.Year
                        })
                        .ToList();

                    return Ok(result);
                }
            }catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //Chi phi moi trang thiet bi trong 1 thang (12 thang)
        [HttpGet("expense")]
        public IActionResult GetExpense(int month, int year) // month = 0 mean service in all year
        {
            try
            {
                var query = (from il in _context.InvoiceLines
                             join inv in _context.Invoices on il.InvoiceId equals inv.InvoiceId into invJoin
                             from inv in invJoin.DefaultIfEmpty()
                             join m in _context.Materials on il.MaterialId equals m.MaterialId into mJoin
                             from m in mJoin.DefaultIfEmpty()
                             where inv != null && inv.Status == 2 && inv.Date.Value.Year == year
                             select new
                             {
                                 Year = inv.Date.Value.Year,
                                 Month = inv.Date.Value.Month,
                                 TotalSpent = (m.UnitPrice * il.Quantity ?? 0)
                             }).ToList();
                if(month == 0)
                {
                    var result = query.Where(x => x.Year == year)
                                                      .GroupBy(x => new { x.Year, x.Month })
                                                      .Select(g => new
                                                      {
                                                          Year = g.Key.Year,
                                                          Month = g.Key.Month,
                                                          TotalSpentOfMonth = g.Sum(x => x.TotalSpent)
                                                      })
                                                      .OrderBy(x => x.Month)
                                                      .ToList<object>();
                    return Ok(result);
                }else
                {
                    var result = query.Where(x => x.Month == month && x.Year == year)
                                  .GroupBy(x => new { x.Year, x.Month })
                                  .Select(g => new
                                  {
                                      Year = g.Key.Year,
                                      Month = g.Key.Month,
                                      TotalPayOfMonth = g.Sum(x => x.TotalSpent)
                                  })
                                  .OrderBy(x => x.Month)
                                  .ToList<object>();
                    return Ok(result);
                }
                
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        //top 8 service duoc dung nhieu nhat all time
        [HttpGet("topService")]
        public ActionResult GetTopSers()
        {
            try
            {
                var result = (from il in _context.InvoiceLines
                              join i in _context.Invoices on il.InvoiceId equals i.InvoiceId
                              group il by il.ServiceId into g
                              orderby g.Count() descending
                              select new
                              {
                                  ServiceId = g.Key,
                                  UsageCount = g.Count()
                              }).Take(8);

                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // top 8 vat lieu duoc dung nhieu nhat all time
        [HttpGet("topMaterial")]
        public ActionResult GetTopMats()
        {
            try
            {
                var result = (from il in _context.InvoiceLines
                              join m in _context.Materials on il.MaterialId equals m.MaterialId
                              group new { il, m } by new { il.MaterialId, m.MaterialName } into g
                              select new 
                              {
                                  MaterialId = g.Key.MaterialId,
                                  MaterialName = g.Key.MaterialName,
                                  TotalQuantity = g.Sum(x => x.il.Quantity),
                                  TotalPay = g.Sum(x => x.m.UnitPrice * x.il.Quantity)
                              })
                         .OrderByDescending(x => x.TotalQuantity)
                         .Take(8)
                         .ToList();
                return Ok(result);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }



    }


}


