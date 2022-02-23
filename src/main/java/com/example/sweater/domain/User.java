package com.example.sweater.domain;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "usr")
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @NonNull private Long id;
    @NonNull private String username;
    @NonNull private String password;
    @NonNull private Boolean active;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;
}
