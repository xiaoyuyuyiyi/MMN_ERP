
%% Sigmiodal function -------------------------
e0 = 2.5;    % Maximum of the sigmoid function
v0 = 6;    % Position of the threshold of the sigmoid function
r  = 0.5;
S = @(x)(2*e0)/(1+exp(r*(v0-x)));
% ---------------------------------------------

N=2000;
settleTime = 500;

X = zeros(5,N);
X(:,1:3) = cca_normrnd(0,1,5,3);

% set noise and error terms
W=randn(7,N);

%% Model parameter selection
if in2 ==1
    
    a(1) =0; a(2) =0; a(3) =0; a(4) =0; a(5) =0;
    b(1) =0; b(2) =0; b(3) =0; b(4) =0; b(5) =0;
    c(1) =0; c(2) =0; c(3) =0; c(4) =0; c(5) =0;
    
elseif in2 ==2
    
    a(1) =3; a(2) =3; a(3) =3; a(4) =3; a(5) =3;
    b(1) =3; b(2) =3; b(3) =3; b(4) =3; b(5) =3;
    c(1) =3; c(2) =3; c(3) =3; c(4) =3; c(5) =3;
    
elseif in2 ==3
    
    a(1) =10; a(2) =10; a(3) =10; a(4) =10; a(5) =10;
    b(1) =10; b(2) =10; b(3) =10; b(4) =10; b(5) =10;
    c(1) =10; c(2) =10; c(3) =10; c(4) =10; c(5) =10;
    
elseif in2 ==4
    
    a(1) = rand; a(2) = rand; a(3) = rand; a(4) = rand; a(5) = rand;
    b(1)=2; b(2)=2; b(3)=2; b(4)=2; b(5)=2;
    c(1)=5; c(2)=5; c(3)=5; c(4)=5; c(5)=5;
    
end

r = sqrt(2);
for i=4:N,
    
    X(1,i) =   0.95*r*S(X(1,i-1)) + W(1,i)+ a(1)*W(6,i) + b(1)*W(7,i-1) + c(1)*W(7,i-2);
    X(2,i) =    1.2*S(X(1,i-1)) + W(2,i)+ a(2)*W(6,i) + b(2)*W(7,i-1) + c(2)*W(7,i-2);
    X(3,i) =    1.5*S(X(1,i-1)) + W(3,i)+ a(3)*W(6,i) + b(3)*W(7,i-1) + c(3)*W(7,i-2);
    X(4,i) =    -1.2*S(X(1,i-1))  + 0.5*r*S(X(4,i-1)) + 0.8*r*S(X(5,i-1)) + W(4,i)+ a(4)*W(6,i) + b(4)*W(7,i-1) + c(4)*W(7,i-2);
    X(5,i) =  0.6*r*S(X(4,i-1))  + 0.6*r*S(X(5,i-1)) + W(5,i) + a(5)*W(6,i) + b(5)*W(7,i-1) + c(5)*W(7,i-2);
    
end

X = X(:,settleTime+1:end);

