create or replace function 
	add_teacher ( the_firstname text, the_lastname text, the_email text)
	returns boolean as
$$
declare
-- declare a variable to be used in the function
total int;

begin
	-- run a query to check if the email exists
	select into total count(*) from teacher 
		where LOWER(email) = LOWER(the_email);

	-- if total is 0 the email doesn't exist
	if (total = 0) then
		-- then add teacher
		insert into teacher (first_name, last_name, email) values (the_firstname, the_lastname, the_email);
		-- and returns true if the teacher was added
		return true;
	else
		-- returns false if the email already exists
		return false;
	end if;

end;
$$
Language plpgsql;