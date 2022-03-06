package com.example.sweater.domain;

import lombok.*;

import javax.persistence.*;

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
    @NonNull private String text;
    @NonNull private String tag;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "author_id")
    @NonNull private User author;
    private String filename;

    public String getAuthorName() {
        return author.getUsername();
    }
}
