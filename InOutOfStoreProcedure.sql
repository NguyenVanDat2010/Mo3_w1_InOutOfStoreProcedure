use classicmodels;

-- vd1: in
delimiter //
drop procedure if exists getCusById;
create procedure getCusById(in cusNum int)
begin
    select *from customers where customerNumber=cusNum;
end //
delimiter ;

call getCusById(175);

-- vd2: out
delimiter //
drop procedure if exists GetCustomersCountByCity;
create procedure GetCustomersCountByCity(in in_city VARCHAR(50),OUT total INT)
begin
    select count(customerNumber) into total from customers where city = in_city;
end //
delimiter ;

call GetCustomersCountByCity('Lyon',@total);

select @total as tongTp;

-- vd3:  inout

delimiter //
drop procedure if exists SetCounter;
create procedure SetCounter(inout counter int,in inc int )
begin
    set counter=counter+inc;
end //
delimiter ;

set @counter=1;
call SetCounter(@counter,1);
call SetCounter(@counter,1);

select @counter;
