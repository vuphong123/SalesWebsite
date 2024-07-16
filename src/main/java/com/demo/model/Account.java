package com.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity
@Table(name="Accounts")
@Builder
public class Account implements Serializable {
    @Id
    @NotBlank(message = "Username invalid")
    private String username;
    @NotBlank(message = "Password invalid")
    private String password;
    @NotBlank(message = "Fullname invalid")
    private String fullname;
    @NotBlank(message = "Email invalid")
    @Email(message = "Incorrect email format")
    private String email;

    private String admin;
}
