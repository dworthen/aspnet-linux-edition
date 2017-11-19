# Stage 1. Building. 
FROM microsoft/aspnetcore:2.0-jessie
WORKDIR /out

# caches restore result by copying csproj file separately
# copies project files into the /source/ of the container.
# COPY *.csproj . 

# Restore dotnet dependencies
# RUN dotnet restore

# copies the rest of your code into /source/
# COPY . .

# microsoft/aspnetcore-build image contains Node
# so may also run npm install
# or other npm related scripts.
# RUN npm install
# RUN npm run build

# Builds to /out in the root of the container
# RUN dotnet publish --output /out/ --configuration Release

# Set environment variables for container
# Dokku maps external port 80 to internal port 5000
# May also omit the following line and ad EXPOSE 80
# This will tell dokku to setup mapping 80:80 instead 80:5000
# and omitting this environment variable will tell ASP.NET Core
# to listen on port 80
ENV ASPNETCORE_URLS http://*:5000

COPY . .

# Stage 2. Running the application
# WORKDIR /out
ENTRYPOINT ["dotnet", "aspnet-linux-edition.dll"]