# David Murphy
# Spring 2017: Edited 08/09/17
# Forest Succession in the Roemer Arobretum, Geneseo NY 14454

# Utilize the transect data from a 1999 study of the Roemer Arboretum to parameterize
# a (Henry Horn's) transition matrix model. The model predicts the arboretum's future tree composition
# during each of the below instances:
#   1. Model the tree succession of the Arboretum before a Thousand Cankers Disease outbreak
#   2. Simulate the hypothetical introduction of the Thousand Canker Disease (TCD)
#   3. Simulate the hypothetical introduction of a Emerald Ash Borer(EAB) outbreak following a TCD outbreak

#################################################################
###################### BEFORE TCD OUTREAK #######################
#################################################################

P1A=.76; P2A=0.0; P3A=1.0; P4A=.39; P6A=1.0; P7A=1.0; P8A=0.0; P9A=.16; P10A=1.0; P11A=0.0; P12A=0.0; P13A=0.0; P14A=0.0; P16A=.35;
P1B=.00; P2B=0.0; P3B=0.0; P4B=.02; P6B=0.0; P7B=0.0; P8B=.33; P9B=0.0; P10B=0.0; P11B=0.0; P12B=0.5; P13B=0.5; P14B=0.0; P16B=.01;
P1C=.00; P2C=1.0; P3C=0.0; P4C=0.0; P6C=0.0; P7C=0.0; P8C=.33; P9C=0.0; P10C=0.0; P11C=0.0; P12C=0.0; P13C=0.0; P14C=0.0; P16C=.02;
P1D=.24; P2D=0.0; P3D=0.0; P4D=.59; P6D=0.0; P7D=0.0; P8D=.34; P9D=.84; P10D=0.0; P11D=0.0; P12D=0.5; P13D=0.5; P14D=0.0; P16D=.58;
P1F=0.0; P2F=0.0; P3F=0.0; P4F=0.0; P6F=0.0; P7F=0.0; P8F=0.0; P9F=0.0; P10F=0.0; P11F=0.0; P12F=0.0; P13F=0.0; P14F=0.0; P16F=0.0;
P1G=0.0; P2G=0.0; P3G=0.0; P4G=0.0; P6G=0.0; P7G=0.0; P8G=0.0; P9G=0.0; P10G=0.0; P11G=0.0; P12G=0.0; P13G=0.0; P14G=0.0; P16G=.01;
P1H=0.0; P2H=0.0; P3H=0.0; P4H=0.0; P6H=0.0; P7H=0.0; P8H=0.0; P9H=0.0; P10H=0.0; P11H=0.0; P12H=0.0; P13H=0.0; P14H=0.0; P16H=0.0;
P1I=0.0; P2I=0.0; P3I=0.0; P4I=0.0; P6I=0.0; P7I=0.0; P8I=0.0; P9I=0.0; P10I=0.0; P11I=0.0; P12I=0.0; P13I=0.0; P14I=0.0; P16I=0.0;
P1J=0.0; P2J=0.0; P3J=0.0; P4J=0.0; P6J=0.0; P7J=0.0; P8J=0.0; P9J=0.0; P10J=0.0; P11J=0.0; P12J=0.0; P13J=0.0; P14J=0.0; P16J=0.0;
P1K=0.0; P2K=0.0; P3K=0.0; P4K=0.0; P6K=0.0; P7K=0.0; P8K=0.0; P9K=0.0; P10K=0.0; P11K=1.0; P12K=0.0; P13K=0.0; P14K=0.0; P16K=.01;
P1L=0.0; P2L=0.0; P3L=0.0; P4L=0.0; P6L=0.0; P7L=0.0; P8L=0.0; P9L=0.0; P10L=0.0; P11L=0.0; P12L=0.0; P13L=0.0; P14L=0.0; P16L=0.0;
P1M=0.0; P2M=0.0; P3M=0.0; P4M=0.0; P6M=0.0; P7M=0.0; P8M=0.0; P9M=0.0; P10M=0.0; P11M=0.0; P12M=0.0; P13M=0.0; P14M=0.0; P16M=0.0;
P1N=0.0; P2N=0.0; P3N=0.0; P4N=0.0; P6N=0.0; P7N=0.0; P8N=0.0; P9N=0.0; P10N=0.0; P11N=0.0; P12N=0.0; P13N=0.0; P14N=1.0; P16N=.02;
P1P=0.0; P2P=0.0; P3P=0.0; P4P=0.0; P6P=0.0; P7P=0.0; P8P=0.0; P9P=0.0; P10P=0.0; P11P=0.0; P12P=0.0; P13P=0.0; P14P=0.0; P16P=0.0;


M = matrix(c(P1A, P2A, P3A, P4A, P6A, P7A, P8A, P9A, P10A, P11A, P12A, P13A, P14A, P16A,
             P1B, P2B, P3B, P4B, P6B, P7B, P8B, P9B, P10B, P11B, P12B, P13B, P14B, P16B,
             P1C, P2C, P3C, P4C, P6C, P7C, P8C, P9C, P10C, P11C, P12C, P13C, P14C, P16C,
             P1D, P2D, P3D, P4D, P6D, P7D, P8D, P9D, P10D, P11D, P12D, P13D, P14D, P16D,
             P1F, P2F, P3F, P4F, P6F, P7F, P8F, P9F, P10F, P11F, P12F, P13F, P14F, P16F,
             P1G, P2G, P3G, P4G, P6G, P7G, P8G, P9G, P10G, P11G, P12G, P13G, P14G, P16G,
             P1H, P2H, P3H, P4H, P6H, P7H, P8H, P9H, P10H, P11H, P12H, P13H, P14H, P16H,
             P1I, P2I, P3I, P4I, P6I, P7I, P8I, P9I, P10I, P11I, P12I, P13I, P14I, P16I,
             P1J, P2J, P3J, P4J, P6J, P7J, P8J, P9J, P10J, P11J, P12J, P13J, P14J, P16J,
             P1K, P2K, P3K, P4K, P6K, P7K, P8K, P9K, P10K, P11K, P12K, P13K, P14K, P16K,
             P1L, P2L, P3L, P4L, P6L, P7L, P8L, P9L, P10L, P11L, P12L, P13L, P14L, P16L,
             P1M, P2M, P3M, P4M, P6M, P7M, P8M, P9M, P10M, P11M, P12M, P13M, P14M, P16M,
             P1N, P2N, P3N, P4N, P6N, P7N, P8N, P9N, P10N, P11N, P12N, P13N, P14N, P16N,
             P1P, P2P, P3P, P4P, P6P, P7P, P8P, P9P, P10P, P11P, P12P, P13P, P14P, P16P),
           nrow = 14, byrow = T)

numyrs = 10
pch.vals = c(0,1,2,3,5,6,7,8,9,10,11,12,13,15)
N = matrix(c(37,3,3,11,1,6,2,7,1,1,1,1,0,42), ncol = 1)

for (i in 2:(numyrs+1)) {
  Ntemp = M %*%N[,(i-1)] # multiply matrix by vector
  N = cbind(N,Ntemp)
}

plot(0,type = "n", xlim = c(0,numyrs),ylim = c(0,100), main = "Transect Before A Thousand Cankers Disease Outbreak",
     ylab = "Population Abundance",xlab = "Time Step",cex.lab = 1.5)

for (i in 1:13) {
  lines(0:numyrs,N[i,],type = "b", pch = pch.vals[i], cex = 1.5)
}

leg.txt = c("Black Walnut","Cedar","Red Oak","White Ash","Scarlet Oak",
            "White Oak","Honey Locust","Wild Pear","Scots Pine","Sour Cherry","Apple",
            "Elm","Maple")

legend("topleft", ncol = 2, pch = pch.vals, cex = .8,leg.txt,lwd = 1)

##############################################################
################ After a TCD outbreak ########################
##############################################################

P1A=.00; P2A=0.0; P3A=0.0; P4A=0.0; P6A=0.0; P7A=0.0; P8A=0.0; P9A=0.0; P10A=0.0; P11A=0.0; P12A=0.0; P13A=0.0; P14A=0.0; P16A=0.0;
P1B=.00; P2B=0.0; P3B=0.0; P4B=.01; P6B=0.0; P7B=0.0; P8B=.33; P9B=0.0; P10B=0.0; P11B=0.0; P12B=0.5; P13B=0.5; P14B=0.0; P16B=.015;
P1C=.00; P2C=1.0; P3C=1.0; P4C=0.0; P6C=0.0; P7C=0.0; P8C=.33; P9C=0.0; P10C=0.0; P11C=0.0; P12C=0.0; P13C=0.0; P14C=0.0; P16C=.02;
P1D=1.0; P2D=0.0; P3D=0.0; P4D=.99; P6D=0.0; P7D=0.0; P8D=.34; P9D=1.0; P10D=0.0; P11D=0.0; P12D=0.5; P13D=0.5; P14D=0.0; P16D=.89;
P1F=0.0; P2F=0.0; P3F=0.0; P4F=0.0; P6F=1.0; P7F=0.0; P8F=0.0; P9F=0.0; P10F=0.0; P11F=0.0; P12F=0.0; P13F=0.0; P14F=0.0; P16F=0.0;
P1G=0.0; P2G=0.0; P3G=0.0; P4G=0.0; P6G=0.0; P7G=1.0; P8G=0.0; P9G=0.0; P10G=0.0; P11G=0.0; P12G=0.0; P13G=0.0; P14G=0.0; P16G=.04;
P1H=0.0; P2H=0.0; P3H=0.0; P4H=0.0; P6H=0.0; P7H=0.0; P8H=0.0; P9H=0.0; P10H=0.0; P11H=0.0; P12H=0.0; P13H=0.0; P14H=0.0; P16H=0.0;
P1I=0.0; P2I=0.0; P3I=0.0; P4I=0.0; P6I=0.0; P7I=0.0; P8I=0.0; P9I=0.0; P10I=0.0; P11I=0.0; P12I=0.0; P13I=0.0; P14I=0.0; P16I=0.0;
P1J=0.0; P2J=0.0; P3J=0.0; P4J=0.0; P6J=0.0; P7J=0.0; P8J=0.0; P9J=0.0; P10J=1.0; P11J=0.0; P12J=0.0; P13J=0.0; P14J=0.0; P16J=0.0;
P1K=0.0; P2K=0.0; P3K=0.0; P4K=0.0; P6K=0.0; P7K=0.0; P8K=0.0; P9K=0.0; P10K=0.0; P11K=1.0; P12K=0.0; P13K=0.0; P14K=0.0; P16K=.015;
P1L=0.0; P2L=0.0; P3L=0.0; P4L=0.0; P6L=0.0; P7L=0.0; P8L=0.0; P9L=0.0; P10L=0.0; P11L=0.0; P12L=0.0; P13L=0.0; P14L=0.0; P16L=0.0;
P1M=0.0; P2M=0.0; P3M=0.0; P4M=0.0; P6M=0.0; P7M=0.0; P8M=0.0; P9M=0.0; P10M=0.0; P11M=0.0; P12M=0.0; P13M=0.0; P14M=0.0; P16M=0.0;
P1N=0.0; P2N=0.0; P3N=0.0; P4N=0.0; P6N=0.0; P7N=0.0; P8N=0.0; P9N=0.0; P10N=0.0; P11N=0.0; P12N=0.0; P13N=0.0; P14N=1.0; P16N=.02;
P1P=0.0; P2P=0.0; P3P=0.0; P4P=0.0; P6P=0.0; P7P=0.0; P8P=0.0; P9P=0.0; P10P=0.0; P11P=0.0; P12P=0.0; P13P=0.0; P14P=0.0; P16P=0.0;


M = matrix(c(P1A, P2A, P3A, P4A, P6A, P7A, P8A, P9A, P10A, P11A, P12A, P13A, P14A, P16A,
             P1B, P2B, P3B, P4B, P6B, P7B, P8B, P9B, P10B, P11B, P12B, P13B, P14B, P16B,
             P1C, P2C, P3C, P4C, P6C, P7C, P8C, P9C, P10C, P11C, P12C, P13C, P14C, P16C,
             P1D, P2D, P3D, P4D, P6D, P7D, P8D, P9D, P10D, P11D, P12D, P13D, P14D, P16D,
             P1F, P2F, P3F, P4F, P6F, P7F, P8F, P9F, P10F, P11F, P12F, P13F, P14F, P16F,
             P1G, P2G, P3G, P4G, P6G, P7G, P8G, P9G, P10G, P11G, P12G, P13G, P14G, P16G,
             P1H, P2H, P3H, P4H, P6H, P7H, P8H, P9H, P10H, P11H, P12H, P13H, P14H, P16H,
             P1I, P2I, P3I, P4I, P6I, P7I, P8I, P9I, P10I, P11I, P12I, P13I, P14I, P16I,
             P1J, P2J, P3J, P4J, P6J, P7J, P8J, P9J, P10J, P11J, P12J, P13J, P14J, P16J,
             P1K, P2K, P3K, P4K, P6K, P7K, P8K, P9K, P10K, P11K, P12K, P13K, P14K, P16K,
             P1L, P2L, P3L, P4L, P6L, P7L, P8L, P9L, P10L, P11L, P12L, P13L, P14L, P16L,
             P1M, P2M, P3M, P4M, P6M, P7M, P8M, P9M, P10M, P11M, P12M, P13M, P14M, P16M,
             P1N, P2N, P3N, P4N, P6N, P7N, P8N, P9N, P10N, P11N, P12N, P13N, P14N, P16N,
             P1P, P2P, P3P, P4P, P6P, P7P, P8P, P9P, P10P, P11P, P12P, P13P, P14P, P16P),
           nrow = 14, byrow = T)

numyrs = 10
pch.vals = c(0,1,2,3,5,6,7,8,9,10,11,12,13,15)
N = matrix(c(37,3,3,11,1,6,2,7,1,1,1,1,0,42), ncol = 1)

for (i in 2:(numyrs+1)) {
  Ntemp = M %*%N[,(i-1)] # multiply matrix by vector
  N = cbind(N,Ntemp)
}
plot(0,type = "n", xlim = c(0,numyrs), main = "Transect After A Thousand Cankers Disease Outbreak", ylim = c(0,100),
     ylab = "Population Abundance",xlab = "Time Step",cex.lab = 1.5)
for (i in 1:13){
  lines(0:numyrs,N[i,],type = "b", pch = pch.vals[i], cex = 1.5)
}
leg.txt = c("Black Walnut","Cedar","Red Oak","White Ash","Scarlet Oak",
            "White Oak","Honey Locust","Wild Pear","Scots Pine","Sour Cherry","Apple",
            "Elm","Maple")
legend("right", ncol = 2, pch = pch.vals, cex = 1.1,leg.txt,lwd = 1)

##############################################################################
################ After both a TCD and EAB outbreak ###########################
##############################################################################


P1A=.00; P2A=0.0; P3A=0.0; P4A=0.0; P6A=0.0; P7A=0.0; P8A=0.0; P9A=0.0; P10A=0.0; P11A=0.0; P12A=0.0; P13A=0.0; P14A=0.0;
P1B=.00; P2B=0.5; P3B=0.0; P4B=.23; P6B=0.0; P7B=0.0; P8B=0.5; P9B=0.0; P10B=0.0; P11B=0.0; P12B=1.0; P13B=1.0; P14B=0.0; 
P1C=.00; P2C=0.5; P3C=1.0; P4C=.23; P6C=0.0; P7C=0.0; P8C=0.5; P9C=0.0; P10C=0.0; P11C=0.0; P12C=0.0; P13C=0.0; P14C=0.0; 
P1D=1.0; P2D=0.0; P3D=0.0; P4D=0.0; P6D=0.0; P7D=0.0; P8D=0.0; P9D=1.0; P10D=0.0; P11D=0.0; P12D=0.0; P13D=0.0; P14D=0.0; 
P1F=0.0; P2F=0.0; P3F=0.0; P4F=0.0; P6F=1.0; P7F=0.0; P8F=0.0; P9F=0.0; P10F=0.0; P11F=0.0; P12F=0.0; P13F=0.0; P14F=0.0; 
P1G=0.0; P2G=0.0; P3G=0.0; P4G=.31; P6G=0.0; P7G=1.0; P8G=0.0; P9G=0.0; P10G=0.0; P11G=0.0; P12G=0.0; P13G=0.0; P14G=0.0; 
P1H=0.0; P2H=0.0; P3H=0.0; P4H=0.0; P6H=0.0; P7H=0.0; P8H=0.0; P9H=0.0; P10H=0.0; P11H=0.0; P12H=0.0; P13H=0.0; P14H=0.0; 
P1I=0.0; P2I=0.0; P3I=0.0; P4I=0.0; P6I=0.0; P7I=0.0; P8I=0.0; P9I=0.0; P10I=0.0; P11I=0.0; P12I=0.0; P13I=0.0; P14I=0.0; 
P1J=0.0; P2J=0.0; P3J=0.0; P4J=0.0; P6J=0.0; P7J=0.0; P8J=0.0; P9J=0.0; P10J=1.0; P11J=0.0; P12J=0.0; P13J=0.0; P14J=0.0; 
P1K=0.0; P2K=0.0; P3K=0.0; P4K=.08; P6K=0.0; P7K=0.0; P8K=0.0; P9K=0.0; P10K=0.0; P11K=1.0; P12K=0.0; P13K=0.0; P14K=0.0; 
P1L=0.0; P2L=0.0; P3L=0.0; P4L=0.0; P6L=0.0; P7L=0.0; P8L=0.0; P9L=0.0; P10L=0.0; P11L=0.0; P12L=0.0; P13L=0.0; P14L=0.0; 
P1M=0.0; P2M=0.0; P3M=0.0; P4M=0.0; P6M=0.0; P7M=0.0; P8M=0.0; P9M=0.0; P10M=0.0; P11M=0.0; P12M=0.0; P13M=0.0; P14M=0.0; 
P1N=0.0; P2N=0.0; P3N=0.0; P4N=.15; P6N=0.0; P7N=0.0; P8N=0.0; P9N=0.0; P10N=0.0; P11N=0.0; P12N=0.0; P13N=0.0; P14N=1.0; 


M = matrix(c(P1A, P2A, P3A, P4A, P6A, P7A, P8A, P9A, P10A, P11A, P12A, P13A, P14A, 
             P1B, P2B, P3B, P4B, P6B, P7B, P8B, P9B, P10B, P11B, P12B, P13B, P14B, 
             P1C, P2C, P3C, P4C, P6C, P7C, P8C, P9C, P10C, P11C, P12C, P13C, P14C, 
             P1D, P2D, P3D, P4D, P6D, P7D, P8D, P9D, P10D, P11D, P12D, P13D, P14D, 
             P1F, P2F, P3F, P4F, P6F, P7F, P8F, P9F, P10F, P11F, P12F, P13F, P14F, 
             P1G, P2G, P3G, P4G, P6G, P7G, P8G, P9G, P10G, P11G, P12G, P13G, P14G, 
             P1H, P2H, P3H, P4H, P6H, P7H, P8H, P9H, P10H, P11H, P12H, P13H, P14H, 
             P1I, P2I, P3I, P4I, P6I, P7I, P8I, P9I, P10I, P11I, P12I, P13I, P14I, 
             P1J, P2J, P3J, P4J, P6J, P7J, P8J, P9J, P10J, P11J, P12J, P13J, P14J, 
             P1K, P2K, P3K, P4K, P6K, P7K, P8K, P9K, P10K, P11K, P12K, P13K, P14K, 
             P1L, P2L, P3L, P4L, P6L, P7L, P8L, P9L, P10L, P11L, P12L, P13L, P14L, 
             P1M, P2M, P3M, P4M, P6M, P7M, P8M, P9M, P10M, P11M, P12M, P13M, P14M, 
             P1N, P2N, P3N, P4N, P6N, P7N, P8N, P9N, P10N, P11N, P12N, P13N, P14N),
           nrow = 13, byrow = T)
numyrs = 10
pch.vals = c(0,1,2,3,5,6,7,8,9,10,11,12,13)
N = matrix(c(0,2,8,94,1,8,0,0,1,1,0,0,1), ncol = 1)

for (i in 2:(numyrs+1)) {
  Ntemp = M %*%N[,(i-1)] # multiply matrix by vector
  N = cbind(N,Ntemp)
}
plot(0,type = "n", xlim = c(0,numyrs), main = "Transect After Both A Thousand Cankers Disease And An Emerald Ash Borer Outbreak", ylim = c(0,100),
     ylab = "Population Abundance",xlab = "Time Step",cex.lab = 1.5)
for (i in 1:13){
  lines(0:numyrs,N[i,],type = "b", pch = pch.vals[i], cex = 1.5)
}
leg.txt = c("Black Walnut","Cedar","Red Oak","White Ash","Scarlet Oak",
            "White Oak","Honey Locust","Wild Pear","Scots Pine","Sour Cherry","Apple",
            "Elm","Maple")
legend("topright", ncol = 2, pch = pch.vals, cex = 1.2,leg.txt,lwd = 1)
