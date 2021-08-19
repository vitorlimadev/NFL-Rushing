import { useContext, useState } from "react";
import { PlayersRushingContext } from "../../providers/PlayersRushingProvider";

import { Loader } from "../Loader";
import {
  Container,
  FilterContainer,
  Input,
  PlayerSearchBox,
  Button,
  DownloadCSVButton,
} from "./styles";

export const TableHeader = () => {
  const { playerRushingData, fetchPlayersData, fetchOnePlayer, loading } =
    useContext(PlayersRushingContext);

  const [playerName, setPlayerName] = useState("");
  const [selectedFilter, setSelectedFilter] = useState(0);

  return (
    <Container>
      <FilterContainer width={650}>
        <PlayerSearchBox>
          <Input
            placeholder="Player name..."
            onChange={(e) => setPlayerName(e.target.value)}
            value={playerName}
          />
          <Button
            selected
            onClick={() => {
              playerName !== ""
                ? fetchOnePlayer(playerName)
                : fetchPlayersData();

              setSelectedFilter(0);
            }}
          >
            Search
          </Button>

          {loading && <Loader />}
        </PlayerSearchBox>
      </FilterContainer>
      <FilterContainer width={950}>
        <Button
          selected={selectedFilter === 1}
          onClick={() => {
            fetchPlayersData("Yds");
            setSelectedFilter(1);
          }}
        >
          Total Rushing Yards (Yds)
        </Button>
        <Button
          selected={selectedFilter === 2}
          onClick={() => {
            fetchPlayersData("Lng");
            setSelectedFilter(2);
          }}
        >
          Longest Rush (Lng)
        </Button>
        <Button
          selected={selectedFilter === 3}
          onClick={() => {
            fetchPlayersData("TD");
            setSelectedFilter(3);
          }}
        >
          Total Rushing Touchdowns (TD)
        </Button>
        <Button
          onClick={() => {
            fetchPlayersData();
            setSelectedFilter(0);
          }}
        >
          Clear filter
        </Button>

        <DownloadCSVButton
          data={playerRushingData}
          filename={"player-rushing.csv"}
        >
          Download CSV
        </DownloadCSVButton>
      </FilterContainer>
    </Container>
  );
};
