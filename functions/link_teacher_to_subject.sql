create or replace function link_teacher_to_subject(the_name text, the_subject text)
returns boolean as

$$
declare 
    myteacher int;
    mysubject int;
    counter int;
begin 

    select teacher.id into myteacher from teacher where teacher.first_name = the_name;
    select subject.id into mysubject from subject where subject.name = the_subject;
    select count(*) into counter from teacher_subject where teacher_subject.teacher_id = myteacher;
        if(counter = 0)
        then
        insert into teacher_subject(teacher_id, subject_id) values (myteacher, mysubject);
        return true;
        else 
        return false;

    end if;

end;
$$
Language plpgsql;