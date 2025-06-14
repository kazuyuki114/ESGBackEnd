using Serilog;

namespace ESGBackEnd.Extension;

public static class SerilogExtension
{
    public static void SerilogConfiguration(this IHostBuilder host)
    {
        host.UseSerilog((context, loggerConfig) =>
        {
            loggerConfig.WriteTo.Console();
        });
    }
}