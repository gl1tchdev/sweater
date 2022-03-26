package com.example.sweater.domain;

import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Collection;
import java.util.Set;

@Entity
@Table(name = "usr")
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @NonNull private Long id;

    @NotBlank(message = "Username is empty")
    @NonNull private String username;

    @NotBlank(message = "Password is empty")
    @NonNull private String password;

    @Transient
    @NotBlank(message = "Password confirmation could not be empty")
    @NonNull private String passwordConfirmation;

    @NonNull private Boolean active = false;

    @Email(message = "Email isn't correct")
    @NotBlank(message = "Email is empty")
    @NonNull private String email;
    private String activationCode;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return getActive();
    }

    public boolean isAdmin() {
        return this.roles.contains(Role.ADMIN);
    }
}
