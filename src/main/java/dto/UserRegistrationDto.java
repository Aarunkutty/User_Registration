package dto;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.Data;

/**
 * Represents a user registration data transfer object. This class is used for
 * mapping user registration information to a database table.
 */
@Entity
@Table(name = "aepl_user_registration")
@Data
public class UserRegistrationDto {

	// The email address of the user. This field is marked as the primary key.
	@Id
	private String email;

	// The name of the user.
	private String name;

	// The Mobile Number of the user.
	private Long mobileNumber;

	// The Date of Birth of the user.
	private String dateOfBirth;

	// The location of the user.
	private String location;

	/*
	 * The Identification Document of the user. This field is stored as a large
	 * object in the database.
	 */
	@Lob
	private byte[] identificationDocument;
}
