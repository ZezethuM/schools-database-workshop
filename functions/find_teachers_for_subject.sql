create or replace function 
    find_teachers_for_subject(the_subjectname text)
	returns table (
		the_teacher text
	) as
$$
declare
    myrow record;
begin

    for myrow in (select teacher.* from teacher join teacher_subject on teacher.id = teacher_subject.teacher_id join subject on teacher_subject.subject_id = subject.id where subject.name = the_subjectname)
    loop
        the_teacher := myrow.first_name;
        return next;
    end loop;
end;
$$
Language plpgsql;


