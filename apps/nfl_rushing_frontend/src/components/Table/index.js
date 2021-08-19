import { useContext, useEffect } from "react";
import { Column, Table as RVTable } from "react-virtualized";

import { PlayersRushingContext } from "../../providers/PlayersRushingProvider";
import { TableHeader } from "../TableHeader";
import { Container } from "./styles";

export const Table = () => {
  const { fetchPlayersData, playerRushingData } = useContext(
    PlayersRushingContext
  );

  useEffect(() => {
    const loadData = async () => {
      await fetchPlayersData();
    };

    loadData();
  }, []);

  return (
    <Container>
      <TableHeader />

      <RVTable
        width={1600}
        height={800}
        headerHeight={20}
        rowHeight={30}
        rowCount={playerRushingData.length}
        rowGetter={({ index }) => playerRushingData[index]}
      >
        <Column label="Name" dataKey="Player" width={200} />
        <Column label="Team" dataKey="Team" width={100} />
        <Column label="Position" dataKey="Pos" width={100} />
        <Column label="Att" dataKey="Att" width={100} />
        <Column label="Att/G" dataKey="Att/G" width={100} />
        <Column label="Yds" dataKey="Yds" width={100} />
        <Column label="Avg" dataKey="Avg" width={100} />
        <Column label="Yds/G" dataKey="Yds/G" width={100} />
        <Column label="TD" dataKey="TD" width={100} />
        <Column label="Lng" dataKey="Lng" width={100} />
        <Column label="1st" dataKey="1st" width={100} />
        <Column label="1st%" dataKey="1st%" width={100} />
        <Column label="20+" dataKey="20+" width={100} />
        <Column label="40+" dataKey="40+" width={100} />
        <Column label="FUM" dataKey="FUM" width={100} />
      </RVTable>
    </Container>
  );
};
