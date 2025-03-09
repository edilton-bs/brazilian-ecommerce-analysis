delimiter $$
create procedure basico(in curso int)
begin
	declare x int;
    set x = 10;
    
    select x*100*curso;

end $$
delimiter ;


call basico(5)