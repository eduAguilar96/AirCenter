class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TABLE user_nationalities (
        id uuid NOT NULL,
        origin_country CHAR(50) NOT NULL,
        currency CHAR(50) NOT NULL,
        PRIMARY KEY(id)
      );

      CREATE TABLE users(
        id uuid NOT NULL,
        name CHAR(50) NOT NULL,
        last_name_p CHAR(50) NOT NULL,
        last_name_m CHAR(50),
        mail CHAR(50) NOT NULL,
        telephone CHAR(50) NOT NULL,
        birth_date DATE NOT NULL,
        passport CHAR(50) NOT NULL,
        nationality_id uuid NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY(nationality_id) REFERENCES user_nationalities(id)
      );

      CREATE TABLE bags(
        id uuid NOT NULL,
        asiento CHAR(50) NOT NULL,
        user_id uuid NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES users(id)
      );

      CREATE TABLE flight_informations(
        id uuid NOT NULL,
        day DATE NOT NULL,
        departure_time DECIMAL NOT NULL,
        arrival_time DECIMAL NOT NULL,
        origin CHAR(50) NOT NULL,
        destination CHAR(50) NOT NULL,
        PRIMARY KEY(id)
      );

      CREATE TABLE tickets(
        id uuid NOT NULL,
        seat CHAR(50) NOT NULL,
        cost INT NOT NULL,
        zone CHAR(50) NOT NULL,
        user_id uuid NOT NULL,
        flight_id uuid NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY (user_id) REFERENCES users(id),
        FOREIGN KEY(flight_id) REFERENCES flight_informations(id)
      );

      CREATE TABLE reservation_informations(
        id uuid NOT NULL,
        flight_id uuid NOT NULL,
        available_tickets INT NOT NULL,
        flight_type BIT NOT NULL,
        capacity INT NOT NULL,
        reservation_id uuid NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY (flight_id) REFERENCES flight_informations(id)
      )
    SQL
  end

  def down
    drop_table :users
    drop_table :bags
    drop_table :user_nationalities
    drop_table :tickets
    drop_table :flight_informations
    drop_table :reservation_informations
  end
end
