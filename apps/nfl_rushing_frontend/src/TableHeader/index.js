import { useState } from 'react'
import { Container, FilterContainer, Input, SearchButton } from "./styles"

export const TableHeader = ({ fetchPlayersData, fetchOnePlayer }) => {

	const [playerName, setPlayerName] = useState("")
	const [selectedFilter, setSelectedFilter] = useState(0)

	return (
		<Container>
			<FilterContainer>
				<span>
					<Input placeholder="Player name..." onChange={(e) => setPlayerName(e.target.value)} value={playerName} />
					<SearchButton selected onClick={() => playerName !== "" ? fetchOnePlayer(playerName) : fetchPlayersData()}>Search</SearchButton>
				</span>
			</FilterContainer>
			<FilterContainer>
				<SearchButton selected={selectedFilter === 1} onClick={() => {
					fetchPlayersData("Yds")
					setSelectedFilter(1)
				}}>Total Rushing Yards (Yds)</SearchButton>
				<SearchButton selected={selectedFilter === 2} onClick={() => {
					fetchPlayersData("Lng")
					setSelectedFilter(2)
				}}>Longest Rush (Lng)</SearchButton>
				<SearchButton selected={selectedFilter === 3} onClick={() => {
					fetchPlayersData("TD")
					setSelectedFilter(3)
				}}>Total Rushing Touchdowns (TD)</SearchButton>
				<SearchButton clear onClick={() => {
					fetchPlayersData()
					setSelectedFilter(0)
				}}>Clear</SearchButton>
			</FilterContainer>
		</Container>
	)
}