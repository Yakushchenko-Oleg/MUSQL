use tmp;

drop table users;

create table users (
	user_id integer unique key auto_increment,
    user_name varchar (50) check (user_name between 0 and 50) not null,
    email varchar (100) unique,
    age integer (128) check (age between 0 and 140),
    gender varchar (1) check (gender in ( "m","f" ))
    ) ;
    
    insert into users (user_id, user_name, email, age , gender) 
			values(1, "John", "Doe", "johndoe@example.com", 30, "M" );
	insert into users (user_id, user_name, email, age , gender) 
			values( "Jane", "Smith", "janesmith@example.com", 25, "F");           
            
    
    