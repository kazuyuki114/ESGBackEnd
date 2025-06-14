using ESGBackEnd.Extension;
using ESGBackEnd.Interfaces;
using ESGBackEnd.Repositories;
using Supabase;

var builder = WebApplication.CreateBuilder(args);

// Add Serilog HostConfiguration
builder.Host.SerilogConfiguration();

// Add services to the container.
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.DefaultIgnoreCondition =
            System.Text.Json.Serialization.JsonIgnoreCondition.WhenWritingNull;

        options.JsonSerializerOptions.Converters.Add(
            new System.Text.Json.Serialization.JsonStringEnumConverter());
    });
builder.Services.AddControllers().AddNewtonsoftJson();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddScoped<ICompanyRepository, CompanyRepository>();
builder.Services.AddScoped<IIndustryRepository, IndustryRepository>();
builder.Services.AddScoped<IReportSubmissionRepository, ReportSubmissionRepository>();
builder.Services.AddScoped<IAIEvaluationRepository, AIEvaluationRepository>();
builder.Services.AddScoped<IEvaluationMetricRepository, EvaluationMetricRepository>();
builder.Services.AddScoped<IESGScoreRepository, ESGScoreRepository>();


builder.Services.AddScoped<Supabase.Client>(_ =>
    new Supabase.Client(
        builder.Configuration["SUPABASE:URL"] ?? throw new InvalidOperationException("SUPABASE:URL configuration is missing"),
        builder.Configuration["SUPABASE:KEY"] ?? throw new InvalidOperationException("SUPABASE:KEY configuration is missing"),
        new SupabaseOptions
        {
            AutoRefreshToken = true,
            AutoConnectRealtime = true
        }));



var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();