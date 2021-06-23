clear all;
T=1; 
M=100; 
k=T/M;
N=50; 
h=1/N;
% Tao luoi.
X=[0:N]*h; 
Y=[0:N]*h; 
R=[0:M]*k;
% Dieu kien dau, tao U tai t=0.
U=zeros((N+1)^2,1);
for i=1:(N+1)
 for j=1:(N+1)
 id=change(N,i,j);
 U(id)=u0(X(j),Y(i));
 end
end
% Tinh U tai t=T
for r=1:M
 % Tao ma tran A va vector b.
 A=zeros((N+1)^2,(N+1)^2);
 b=zeros((N+1)^2,1);
 for i=1:(N+1)
  for j=1:(N+1)
   id=change(N,i,j); % chi so cua diem (i,j)
   idlelf=change(N,i,j-1); % chi so cua diem nam ben trai diem (i,j)
   idright=change(N,i,j+1); % chi so cua diem nam ben phai (i,j)
   idup=change(N,i-1,j); % chi so cua diem nam tren (i,j)
   iddown=change(N,i+1,j); % chi so cuadiem nam duoi (i,j)
   if ((i>1)&&(i<N+1)&&(j>1)&&(j<N+1))
    A(id,id)=h^2/k+4;
    A(id,idlelf)=-1;
    A(id,idright)=-1;
    A(id,idup)=-1;
    A(id,iddown)=-1;
    b(id)=f(X(j),Y(i),R(r))*h^2+U(id)*h^2/k;
   else
    A(id,id)=1;
    b(id)=uex(X(j),Y(i),R(r));
   end
  end
 end
% Giai he AU=b.
 U=A\b; %Day la phep giai U tai t=R(r).
end
% Tinh toan cac sai so.
Uex=zeros((N+1)^2,1);
for i=1:(N+1)
 for j=1:(N+1)
  id=change(N,i,j);
  Uex(id)=uex(X(j),Y(i),T);
 end
end
disp('error (in norm max)')
errmax=norm(U-Uex,inf)
% Ve cac do thi.
UU=zeros(N+1,N+1);
for i=1:(N+1)
 for j=1:(N+1)
  UU(i,j)=U(change(N,i,j));
 end
end
figure(1)
surf(X,Y,UU);
axis([0 1 0 1 0 3])
hold on
title('Hinh 8.5a. Day la do thi cua phep giai so.')
hold off
disp('Vui long nhan phim bat ky de tiep tuc')
pause % Dung thuc thi chuong trinh cho den khi an phim bat ky.
% Tao ham gia tri dung de ve do thi.
UUex=zeros(N+1,N+1);
for i=1:(N+1)
 for j=1:(N+1)
  UUex(i,j)=Uex(change(N,i,j));
 end
end
figure(2)
surf(X,Y,UUex);
axis([0 1 0 1 0 3])
xlabel('X');
ylabel('Y');
zlabel('Z');
hold on
title('Hnh 8.5b. Day la do thi cua phep giai chinh xac. ')
hold off

