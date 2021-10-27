package ua.lviv.iot.model;

import lombok.*;
import ua.lviv.iot.annotations.Column;
import ua.lviv.iot.annotations.PrimaryKey;
import ua.lviv.iot.annotations.Table;

import java.time.LocalDateTime;

@Table(name = "event")
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "id")
public class Event {

    @PrimaryKey
    @Column(name = "id")
    private Integer id;

    @Column(name = "type_of_event_id")
    private Integer typeOfEventId;

    @Column(name = "artist_or_group_id")
    private Integer artistOrGroupId;

    @Column(name = "data")
    private LocalDateTime data;

    @Column(name = "duration")
    private String duration;

    @Column(name = "description")
    private String description;

    @Column(name = "max_seats_available")
    private Integer maxSeatsAvailable;
}
