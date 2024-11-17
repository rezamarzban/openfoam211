FROM ubuntu:12.04

# Use the archived repository
RUN sed -i 's/http:\/\/archive.ubuntu.com/http:\/\/old-releases.ubuntu.com/' /etc/apt/sources.list

# Update package lists from the archived repositories
RUN apt-get update

# Install wget
RUN apt-get install -y wget

# Add OpenFOAM repository key
RUN sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"

# Add OpenFOAM repository
RUN sh -c "echo deb http://dl.openfoam.org/ubuntu precise main > /etc/apt/sources.list.d/openfoam.list"

# Update package lists again
RUN apt-get update

# Install OpenFOAM 2.11
RUN apt-get install -y openfoam211
