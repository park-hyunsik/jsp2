package board.vo;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor

public class Gallery {
	private int idx;
	private String title;
	private Timestamp wdate;
	private String filenames;
}
