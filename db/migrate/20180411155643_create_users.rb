class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TABLE flights(
        id uuid,
        day DATE NOT NULL,
        departure_time DECIMAL NOT NULL,
        arrival_time DECIMAL NOT NULL,
        origin CHAR(50) NOT NULL,
        destination CHAR(50) NOT NULL,
        capacity INT NOT NULL,
        base_price INT NOT NULL DEFAULT 1000,
        PRIMARY KEY(id)
      );

      CREATE TABLE reservations(
        id uuid,
        flight_id uuid,
        PRIMARY KEY(id),
        FOREIGN KEY(flight_id) REFERENCES flights(id)
      );

      CREATE TABLE users(
        id uuid,
        reservation_id uuid,
        name CHAR(50) NOT NULL,
        last_name_p CHAR(50) NOT NULL,
        last_name_m CHAR(50),
        mail CHAR(50) NOT NULL,
        telephone CHAR(50) NOT NULL,
        birth_date DATE NOT NULL,
        passport CHAR(50) NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY(reservation_id) REFERENCES reservations(id)
      );

      CREATE TABLE tickets(
        id uuid,
        user_id uuid,
        reservation_id uuid,
        seat CHAR(50) NOT NULL,
        cost INT NOT NULL,
        zone CHAR(50) NOT NULL,
        PRIMARY KEY(id),
        FOREIGN KEY(user_id) REFERENCES users(id),
        FOREIGN KEY(reservation_id) REFERENCES reservations(id)
      );

    SQL
  end

  def down
    drop_table :tickets
    drop_table :users
    drop_table :reservations
    drop_table :flights
  end
end
