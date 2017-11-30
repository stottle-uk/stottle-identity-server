FROM microsoft/dotnet:2.0-sdk

RUN apt-get update
RUN apt-get -qq update

COPY ./stottle-identity-server.csproj /app/
WORKDIR /app/
RUN dotnet restore
ADD . /app/

RUN dotnet publish -c Debug -o out

EXPOSE 5000
ENTRYPOINT ["dotnet", "out/stottle-identity-server.dll"]