# csharp

```sh
sudo curl -o /usr/local/bin/nuget.exe https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
alias nuget="mono /usr/local/bin/nuget.exe"

nuget help

nuget list -Source <source>
nuget list -Source C:\Users\username\source\repos\MyProject\packages

nuget install <packageID> -OutputDirectory packages
nuget install Newtonsoft.Json -OutputDirectory packages
nuget install Newtonsoft.Json -Version 12.0.1
nuget install Google.Protobuf -Version 3.12.3
```

