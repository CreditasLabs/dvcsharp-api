FROM mcr.microsoft.com/dotnet/core/sdk:2.2
LABEL MAINTAINER "Appsecco"

ENV ASPNETCORE_URLS=http://0.0.0.0:5000

COPY . /app

WORKDIR /app

RUN dotnet restore dvcsharp-api.sln \
    && dotnet ef database update

EXPOSE 5000

CMD ["dotnet", "watch", "run"]
