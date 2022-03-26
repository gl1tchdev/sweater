package com.example.sweater.domain;

import lombok.*;
import org.hibernate.validator.constraints.Length;


import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Empty message")
    @Length(max = 2048, message = "Too large message (more than 2 KB")
    private String text;
    @Length(max = 255, message = "Too large tag")
    @NotBlank(message = "Empty tag")
    @NonNull private String tag;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "author_id")
    @NonNull private User author;
    private String filename;

    public String getAuthorName() {
        return author.getUsername();
    }
}
