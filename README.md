# ESG Analytics Backend

A comprehensive ESG (Environmental, Social, Governance) analytics backend system built with .NET 8 and Supabase for Techcombank's ESG evaluation platform.

## 🌟 Features

- **Complete CRUD Operations** for all ESG entities (Companies, Industries, Reports, AI Evaluations, ESG Scores, Evaluation Metrics)
- **AI-Powered ESG Evaluations** with detailed scoring across 21 metrics
- **Company ESG Analytics** with latest performance data
- **ESG Rankings** with pagination support
- **RESTful API** with Swagger/OpenAPI documentation
- **PostgreSQL Database** with Supabase integration
- **Comprehensive Data Validation** and error handling
- **Structured Logging** with Serilog
- **Memory & Redis Caching** support

## 🏗️ Architecture

### Database Schema

- **6 Core Tables**: `industries`, `companies`, `report_submissions`, `ai_evaluations`, `esg_scores`, `evaluation_metrics`
- **UUID Primary Keys** for enhanced security
- **Foreign Key Relationships** ensuring data integrity
- **Check Constraints** for ESG score validation (0-100 range)
- **Optimized Indexes** for performance

### API Controllers

#### Core CRUD Operations

- **IndustryController**: `/api/industry` - Industry management
- **CompanyController**: `/api/company` - Company management
- **ReportSubmissionController**: `/api/reportsubmission` - ESG report submissions
- **AIEvaluationController**: `/api/aievaluation` - AI evaluation management
- **ESGScoreController**: `/api/esgscore` - ESG scoring (CREATE, UPDATE, DELETE only)
- **EvaluationMetricController**: `/api/evaluationmetric` - Detailed metrics (CREATE, UPDATE, DELETE only)

#### Analytics Endpoints

- **ESGAnalyticsController**: `/api/esganalytics`
  - `GET /company/{companyId}/latest` - Latest ESG data for a company
  - `GET /ranking?page=1&pageSize=10` - ESG company rankings

## 📊 ESG Metrics Framework

### Environmental Metrics (7 categories)

- **Climate Action** - Climate change mitigation and adaptation
- **Energy Transition** - Renewable energy adoption and efficiency
- **Water Stewardship** - Water conservation and management
- **Biodiversity & Nature** - Ecosystem protection and restoration
- **Pollution Prevention** - Air, water, and soil pollution control
- **Circular Economy** - Waste reduction and resource efficiency
- **Sustainable Practices** - Overall environmental sustainability

### Social Metrics (7 categories)

- **Diversity & Inclusion** - Workplace diversity and equal opportunities
- **Workforce Development** - Employee training and career development
- **Health & Safety** - Occupational health and safety standards
- **Human Rights** - Human rights protection and labor standards
- **Community Engagement** - Local community involvement and impact
- **Customer & Stakeholder Relations** - Stakeholder engagement quality
- **Financial Inclusion** - Access to financial services and products

### Governance Metrics (8 categories)

- **Corporate Governance** - Board structure and governance practices
- **Ethics & Integrity** - Business ethics and anti-corruption measures
- **Transparency & Disclosure** - Financial and non-financial reporting
- **Risk Management** - Enterprise risk management frameworks
- **Compliance & Legal** - Regulatory compliance and legal adherence
- **Stakeholder Relations** - Stakeholder engagement and communication
- **Innovation & Technology** - Technology adoption and innovation
- **Cybersecurity & Data Protection** - Information security and privacy

## 🚀 Getting Started

### Prerequisites

- **.NET 8 SDK** or later
- **PostgreSQL 12+** (via Supabase)
- **Visual Studio 2022** or **VS Code** (recommended)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/YOUR_USERNAME/ESGBackEnd.git
   cd ESGBackEnd
   ```

2. **Configure Supabase Connection**
   Update `appsettings.json` with your Supabase credentials:

   ```json
   {
     "Supabase": {
       "Url": "your-supabase-project-url",
       "Key": "your-supabase-service-role-key"
     }
   }
   ```

3. **Set up Database Schema**

   ```bash
   # Run the database creation script in your Supabase SQL editor
   # or via psql if using direct PostgreSQL connection
   psql -d your_database -f create_esg_database.sql
   ```

4. **Restore Dependencies**

   ```bash
   dotnet restore
   ```

5. **Build the Project**

   ```bash
   dotnet build
   ```

6. **Run the Application**

   ```bash
   dotnet run
   ```

7. **Access API Documentation**
   - **Swagger UI**: `https://localhost:5001/swagger`
   - **API Base URL**: `https://localhost:5001/api`

## 📝 API Usage Examples

### Create Company

```bash
curl -X 'POST' \
  'https://localhost:5001/api/company' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "Techcombank",
    "email": "esg@techcombank.com.vn",
    "industryId": "industry-guid-here"
  }'
```

### Submit ESG Report

```bash
curl -X 'POST' \
  'https://localhost:5001/api/reportsubmission' \
  -H 'Content-Type: application/json' \
  -d '{
    "companyId": "company-guid-here",
    "title": "2024 ESG Sustainability Report",
    "year": 2024,
    "fileUrl": "https://example.com/report.pdf",
    "fileSize": 2048576
  }'
```

### Create AI Evaluation

```bash
curl -X 'POST' \
  'https://localhost:5001/api/aievaluation' \
  -H 'Content-Type: application/json' \
  -d '{
    "submissionId": "submission-guid-here",
    "recommendations": "Improve renewable energy adoption and enhance diversity programs",
    "keyFindings": "Strong governance practices, moderate environmental performance"
  }'
```

### Create ESG Score

```bash
curl -X 'POST' \
  'https://localhost:5001/api/esgscore' \
  -H 'Content-Type: application/json' \
  -d '{
    "aiEvaluationId": "ai-evaluation-guid-here",
    "overallScore": 78.5,
    "environmentalScore": 72.0,
    "socialScore": 82.0,
    "governanceScore": 81.5
  }'
```

### Get Company Latest ESG Data

```bash
curl -X 'GET' \
  'https://localhost:5001/api/esganalytics/company/{companyId}/latest'
```

### Get ESG Rankings

```bash
curl -X 'GET' \
  'https://localhost:5001/api/esganalytics/ranking?page=1&pageSize=10'
```

## 🛠️ Technology Stack

- **Framework**: .NET 8 (ASP.NET Core Web API)
- **Database**: PostgreSQL via Supabase
- **ORM**: Supabase Postgrest Client
- **Logging**: Serilog with ASP.NET Core integration
- **Caching**: Microsoft Extensions Caching (Memory + Redis support)
- **Serialization**: Newtonsoft.Json + System.Text.Json
- **API Documentation**: Swagger/OpenAPI (Swashbuckle)
- **Configuration**: ASP.NET Core Configuration system

### NuGet Dependencies

```xml
<PackageReference Include="Microsoft.AspNetCore.Mvc.NewtonsoftJson" Version="8.0.17" />
<PackageReference Include="Microsoft.Extensions.Caching.Memory" Version="9.0.6" />
<PackageReference Include="Microsoft.Extensions.Caching.StackExchangeRedis" Version="9.0.6" />
<PackageReference Include="Newtonsoft.Json" Version="13.0.3" />
<PackageReference Include="Serilog" Version="4.3.0" />
<PackageReference Include="Serilog.AspNetCore" Version="9.0.0" />
<PackageReference Include="Supabase" Version="1.1.1" />
<PackageReference Include="Swashbuckle.AspNetCore" Version="6.6.2" />
```

## 📁 Project Structure

```
ESGBackEnd/
├── Controllers/              # API Controllers
│   ├── AIEvaluationController.cs
│   ├── CompanyController.cs
│   ├── ESGAnalyticsController.cs
│   ├── ESGScoreController.cs
│   ├── EvaluationMetricController.cs
│   ├── IndustryController.cs
│   └── ReportSubmissionController.cs
├── Models/                   # Data Models
│   ├── AIEvaluation.cs
│   ├── Company.cs
│   ├── ESGScore.cs
│   ├── EvaluationMetric.cs
│   ├── Industry.cs
│   └── ReportSubmission.cs
├── DTOs/                     # Data Transfer Objects
│   ├── Pagination/
│   ├── Create*DTO.cs         # Creation DTOs
│   ├── Update*DTO.cs         # Update DTOs
│   └── *DTO.cs              # Response DTOs
├── Interfaces/               # Repository Interfaces
├── Repositories/             # Data Access Layer
├── Mapper/                   # Object Mapping (AutoMapper)
├── Extension/                # Extension Methods
├── Properties/               # Launch settings
├── create_esg_database.sql   # Database Schema
├── *.sql                    # Database migration scripts
├── appsettings.json         # Configuration
├── Program.cs               # Application entry point
├── ESGBackEnd.csproj        # Project file
└── README.md
```

## 🔒 Security Features

- **UUID Primary Keys** prevent enumeration attacks
- **Comprehensive Input Validation** with Data Annotations
- **Foreign Key Constraints** ensure referential integrity
- **Environment-based Configuration** for sensitive data
- **Supabase Row Level Security** (RLS) support
- **HTTPS Enforcement** in production

## 📈 Performance Optimizations

- **Database Indexes** on frequently queried columns (`id`, `company_id`, `submission_id`)
- **Pagination Support** for large datasets
- **Memory Caching** for frequently accessed data
- **Redis Caching** support for distributed scenarios
- **Connection Pooling** via Supabase client
- **Efficient Query Patterns** with proper filtering

## 🧪 API Testing

### Using the included HTTP file

The project includes `ESGBackEnd.http` for testing API endpoints directly in VS Code or Visual Studio.

### Swagger UI

Access the interactive API documentation at `https://localhost:5001/swagger` when running in development mode.

## 🚀 Deployment

### Development

```bash
dotnet run --environment Development
```

### Production

```bash
dotnet publish -c Release -o ./publish
dotnet ./publish/ESGBackEnd.dll
```

### Docker (Optional)

```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["ESGBackEnd.csproj", "."]
RUN dotnet restore "ESGBackEnd.csproj"
COPY . .
RUN dotnet build "ESGBackEnd.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ESGBackEnd.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ESGBackEnd.dll"]
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow C# coding conventions
- Add XML documentation for public APIs
- Include unit tests for new features
- Update README for significant changes

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏢 About

Developed for **Techcombank's ESG Analytics Initiative** to provide comprehensive environmental, social, and governance scoring and analytics capabilities for the banking sector's sustainability reporting requirements.

### Key Stakeholders

- **Techcombank** - Primary client and use case
- **ESG Reporting Teams** - End users for data input and analysis
- **Compliance Teams** - Regulatory reporting and validation
- **Executive Leadership** - Strategic ESG performance insights

## 📞 Support

For support and questions:

- Open an issue in the GitHub repository
- Contact the development team
- Review the API documentation at `/swagger`

---

**Built with ❤️ for sustainable finance and ESG analytics**
