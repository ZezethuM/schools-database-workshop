create or replace function find_teachers_teaching_multiple_subjects(numofsub int)
returns table (
    the_teachers text
) as 

$$
declare 
    myrow record;

begin 

    for myrow in (
        select teacher.first_name, count(teacher_subject.teacher_id) as counter from teacher_subject 
        join teacher 
        on teacher_subject.teacher_id = teacher.id 
        group by  teacher.first_name, teacher_subject.teacher_id
        having count(teacher_subject.teacher_id) = numofsub
    )
    loop
        the_teachers := myrow.first_name;
        return next;
    end loop;

end;
$$
Language plpgsql;