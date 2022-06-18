function[dFx]=dF(x,r)
    n = [138 83 64; 64 67 84];

    dFx(1) = -sum(n(1,:))/x(1);
    dFx(2) = -sum(n(2,:))/x(2);
    dFx(3) = -sum(n(:,1))/x(3);
    dFx(4) = -sum(n(:,2))/x(4);
    dFx(5) = -sum(n(:,3))/x(5);

    %dFx je redak
  
    gx = g(x)';
    dgx = zeros(14,5);
    for i=1:5
        dgx(2*i-1,i) = 1;
        dgx(2*i,i) = -1;
    end

    dgx(11,1)=1;
    dgx(11,2)=1;
    dgx(12,1)=-1;
    dgx(12,2)=-1;
    dgx(13,3)=1;
    dgx(13,4)=1;
    dgx(13,5)=1;
    dgx(14,3)=-1;
    dgx(14,4)=-1;
    dgx(14,5)=-1;

    dgx = dgx'; %ovo je sigurno okej!
  
    tmp=zeros(5,1);
   
    for i=1:10
        tmp=tmp+2*min(gx(i),0)*dgx(:,i);
    end
  
    tmp=tmp+2*gx(11)*dgx(:,11)+2*gx(13)*dgx(:,13);
    dFx = dFx';
    dFx=dFx+r*tmp;

  end