import { Table } from "./components/Table";
import { PlayersRushingProvider } from "./providers/PlayersRushingProvider";

const App = () => {
  return (
    <PlayersRushingProvider>
      <Table />
    </PlayersRushingProvider>
  );
};
export default App;
