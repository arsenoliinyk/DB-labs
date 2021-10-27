package ua.lviv.iot.model;

import lombok.*;
import ua.lviv.iot.annotations.Column;
import ua.lviv.iot.annotations.PrimaryKey;
import ua.lviv.iot.annotations.Table;

@Table(name = "type_of_delivery")
@NoArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode(of = "id")
public class TypeOfDelivery {

    @PrimaryKey
    @Column(name = "id")
    private Integer id;

    @Column(name = "type")
    private String type;

    @Column(name = "delivery_description")
    private String deliveryDescription;
}
