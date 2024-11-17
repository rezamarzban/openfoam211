# openfoam211
Most minimal OpenFoam 2.1.1 docker image based on Ubuntu 12.0.4

Install docker for `Ubuntu 22.0.4`:

```
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo systemctl status docker
```

**build & push**

```
docker build -t rm314159/openfoam211:latest .
docker push rm314159/openfoam211:latest
```

**pull**

```
docker pull rm314159/openfoam211:latest
```

**install**

```
docker run -it -d --name container1 rm314159/openfoam211
```

**run**

```
docker start -i container1
```

**save & load**

Run `docker images` to list present images, Then:

```
docker save -o openfoam211_image.tar rm314159/openfoam211
```

To load an image from file:

```
docker load -i openfoam211_image.tar
```

**use**

```
source /opt/openfoam211/etc/bashrc
```

Then:
```
cd /root
mkdir OpenFOAM
cd OpenFOAM
mkdir root-2.1.x
cd root-2.1.x
```

Clone & Build `ddtFoam`:

```
sudo apt-get update
sudo apt-get install build-essential -y
git clone http://git.code.sf.net/p/ddtfoam/code ddtfoam-code
cd ddtfoam-code
./Allwmake
```

**export & import**

Run `docker ps` even with and without `-a` switch to list containers, Then, to export `container1` including its modifications:

```
docker export -o container1_backup.tar container1
```

To import from saved container file to new image named `ddtfoam`:

```
docker import container1_backup.tar rm314159/ddtfoam:latest
```

