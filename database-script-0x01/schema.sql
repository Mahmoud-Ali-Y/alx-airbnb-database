CREATE TABLE User (
    user_id int NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255),
    email varchar(255) unique,
    password_hash varchar(255) NOT NULL,
    phone_number varchar(255) NULL,
    user_role ENUM("guest", "host", "admin") NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);

CREATE TABLE Property (
    property_id int NOT NULL,
    Foreign Key (Indexedhost_id) references User(user_id),
    property_name varchar(255) NOT NULL,
    property_description TEXT NOT NULL,
    property_location varchar(255) NOT NULL,
    pricepernight DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (property_id)
);

CREATE TABLE Booking (
    booking_id int NOT NULL,
    Foreign Key (Indexedproperty_id) references Property(property_id),
    Foreign Key (Indexeduser_id) references User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM ("pending", "confirmed", "canceled") NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id)
);

CREATE TABLE Payment (
    payment_id int NOT NULL,
    Foreign Key (Indexedbooking_id) references Booking(booking_id),
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM ("credit_card", "paypal", "stripe") NOT NULL,
    PRIMARY KEY (payment_id)
);

CREATE TABLE Review (
    review_id int NOT NULL,
    Foreign Key (Indexedproperty_id) references Property(property_id),
    Foreign Key (Indexeduser_id) references User(user_id),
    rating int NOT NULL, 
    CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (review_id)
);

CREATE TABLE Message (
    message_id int NOT NULL,
    Foreign Key (Indexedsender_id) references User(user_id),
    Foreign Key (recipient_id) references User(user_id),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (message_id)
);