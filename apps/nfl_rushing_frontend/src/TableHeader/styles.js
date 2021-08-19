import styled from 'styled-components'

export const Container = styled.div`
  width: 1590px;
  padding: 20px 10px;
  display: flex;
`

export const FilterContainer = styled.div`
  width: 800px;
  display: flex;
  justify-content: space-between;
  align-content: center;
`

export const SearchButton = styled.button`
  margin-left: 20px;
  padding: 4px 15px;
  background-color: ${({ clear, selected }) => selected ? "rgba(0, 120, 253, 0.75)" : clear ? "green" : "gray"};
  border-radius: 10px;
  border: none;
  color: white;
  cursor: pointer;
`

export const Input = styled.input`
  border-radius: 10px;
  padding: 4px 8px;
  border: none;
`