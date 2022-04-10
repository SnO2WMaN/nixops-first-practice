{
  network.description = "Web server";

  webserver =
    { config, pkgs, ... }:
    {
      services.httpd.enable = true;
      services.httpd.adminAddr = "alice@example.org";
      networking.firewall.allowedTCPPorts = [ 80 ];

      services.httpd.logFormat = "combined";
      services.httpd.virtualHosts = {
        "main" = {
          documentRoot = "/tmp";
        };
      };
    };
}
