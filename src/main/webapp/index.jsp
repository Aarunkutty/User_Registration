
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>User Registration</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.css">

<style>
@import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

html, body {
	height: 100%;
}

body {
	display: grid;
	place-items: center;
	background: gray;
	text-align: center;
}

.content {
	width: 400px;
	padding: 40px 30px;
	background: #ffffff;
	border-radius: 10px;
	box-shadow: -3px -3px 7px #ffffff73, 2px 2px 5px
		rgba(94, 104, 121, 0.288);
}

.content .text {
	font-size: 33px;
	font-weight: 600;
	margin-bottom: 35px;
	color: #595959;
}

.field {
	height: 50px;
	width: 100%;
	display: flex;
	position: relative;
	margin-bottom: 20px;
}

.field input, .field select {
	height: 100%;
	width: 100%;
	padding-left: 35px;
	outline: none;
	border: none;
	font-size: 18px;
	background: #ffffff;
	color: #595959;
	border-radius: 25px;
	box-shadow: inset 2px 2px 5px #ced0d7, inset -5px -5px 10px #ffffff73;
}

.field input:focus, .field select:focus {
	box-shadow: inset 1px 1px 2px #BABECC, inset -1px -1px 2px #ffffff73;
}

.field span {
	position: absolute;
	color: #595959;
	width: 50px;
	line-height: 50px;
	pointer-events: none;
}

.field input:focus ~ span, .field select:focus ~ span {
	opacity: 0;
}

span {
	color: red;
}

.field label {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	left: 35px;
	pointer-events: none;
	color: #666666;
}

.forgot-pass {
	text-align: left;
	margin: 10px 0 10px 5px;
}

.forgot-pass a {
	font-size: 16px;
	color: #3498db;
	text-decoration: none;
}

.forgot-pass:hover a {
	text-decoration: underline;
}

.file-input-wrapper {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.file-input-button {
	height: 50px;
	padding: 0 20px;
	border: none;
	outline: none;
	font-size: 18px;
	background: #ffffff;
	color: #7b85c7;
	border-radius: 25px;
	/*      box-shadow: inset 2px 2px 5px #BABECC, inset -5px -5px 10px #ffffff73;*/
	box-shadow: 2px 2px 5px #BABECC, -5px -5px 10px #ffffff73;
	cursor: pointer;
	line-height: 50px;
}

.file-input {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
	width: 100%;
	height: 100%;
	cursor: pointer;
}

button {
	margin: 15px 0;
	width: 100%;
	height: 50px;
	font-size: 18px;
	line-height: 50px;
	font-weight: 600;
	background: #ffffff;
	border-radius: 25px;
	border: none;
	outline: none;
	cursor: pointer;
	color: #0c20a2;
	box-shadow: 2px 2px 5px #BABECC, -5px -5px 10px #ffffff73;
}

button:focus {
	color: #595959;
	box-shadow: inset 2px 2px 5px #BABECC, inset -5px -5px 10px #ffffff73;
}

h2, i {
	color: #0c20a2
}

.success-message {
	background-color: #d4edda;
	border-color: #c3e6cb;
	color: #155724;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 4px;
	display: none;
}
</style>
</head>
<body>

	<div class="success-message" id="successMessage">
		<p>Registration Successful!</p>
	</div>

	<div class="content">
		<h2>User Registration</h2>

		<form id="registrationForm" onsubmit="return validateForm()"
			action="signup" method="post">
			<div class="field">
				<i class="far fa-user field-icon"></i> <input type="text" id="name"
					name="name" required pattern="^[A-Za-z ]+$" placeholder="Name">
			</div>

			<div class="field">
				<i class="far fa-envelope field-icon"></i> <input type="email"
					id="email" name="email" required placeholder="Email">
			</div>
			<div class="field">
				<i class="fas fa-phone field-icon"></i> <input type="tel"
					id="mobileNumber" name="mobileNumber" required pattern="[0-9]+"
					placeholder="Mobile Number">
			</div>

			<div class="field">
				<i class="far fa-calendar-alt field-icon"></i> <input type="text"
					id="dateOfBirth" name="dateOfBirth"
					placeholder="Date of Birth (dd-mm-yyyy)" required>
			</div>
			<span class="error-message" id="dateOfBirthError"></span>

			<div class="field">
				<i class="fas fa-map-marker-alt field-icon"></i> <select
					id="location" name="location" required>
					<option value="" disabled selected>Select location</option>
					<option value="Any Location">Any Location</option>
					<option value="Bangalore">Bangalore</option>
					<option value="Hyderabad">Hyderabad</option>
					<option value="Chennai">Chennai</option>
					<option value="New Delhi">New Delhi</option>
				</select>
			</div>

			<div class="file-input-wrapper">
				<i class="fas fa-file-upload field-icon"></i> <label
					for="identificationDocument" class="file-input-button"
					id="fileLabel">Identification Document</label> <input type="file"
					id="identificationDocument" name="identificationDocument"
					accept=".pdf, .png" class="file-input" required
					onchange="updateFileName(this)">
			</div>

			<button>Sign up</button>

		</form>


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/flatpickr@4.6.9/dist/flatpickr.min.js"></script>
	<script>
		flatpickr("#dateOfBirth", {
			dateFormat : "d-m-Y",
		});

		function updateFileName(input) {
			const fileNameElement = document.getElementById("fileLabel");
			if (input.files.length > 0) {
				fileNameElement.textContent = input.files[0].name;
			} else {
				fileNameElement.textContent = "Identification Document";
			}
		}

		function validateForm() {
			const nameInput = document.getElementById("name");
			const emailInput = document.getElementById("email");
			const mobileNumberInput = document.getElementById("mobileNumber");
			const dateOfBirthInput = document.getElementById("dateOfBirth");
			const locationInput = document.getElementById("location");
			const identificationDocumentInput = document
					.getElementById("identificationDocument");

			const dateOfBirthError = document
					.getElementById("dateOfBirthError");

			dateOfBirthError.textContent = "";

			if (!emailInput.validity.valid) {
				emailError.textContent = "Please enter a valid email address.";
				return false;
			}

			if (!mobileNumberInput.validity.valid) {
				mobileNumberError.textContent = "Mobile number must contain only numbers (0-9).";
				return false;
			}


		      if (!dateOfBirthInput.validity.valid) {
		        dateOfBirthError.textContent = "Please enter a valid date in the format dd-mm-yyyy.";
		        return false;
		      }

		      const dateOfBirthValue = dateOfBirthInput.value;
		      const dateOfBirthRegex = /^\d{2}-\d{2}-\d{4}$/;
		      if (!dateOfBirthValue.match(dateOfBirthRegex)) {
		        dateOfBirthError.textContent = "Please enter a valid date in the format dd-mm-yyyy.";
		        return false;
		      }

		      const [day, month, year] = dateOfBirthValue.split("-");
		      const parsedDateOfBirth = new Date(`${year}-${month}-${day}`);

		      if (isNaN(parsedDateOfBirth.getTime())) {
		        dateOfBirthError.textContent = "Please enter a valid date.";
		        return false;
		      }

		      if (new Date() - parsedDateOfBirth < 21 * 365 * 24 * 60 * 60 * 1000) {
		        dateOfBirthError.textContent = "You must be above 21 years old.";
		        return false;
		      }


		}
		
	</script>
</body>
</html>
