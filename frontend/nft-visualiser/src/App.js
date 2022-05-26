import { NFTCard } from "./components/NftCard";
import styled from "styled-components";

function App() {
  let nfts = [
    {
      name: "Mario",
      symbol: "SMWC",
      copies: 10,
      image: "https://picsum.photos/150",
    },
    {
      name: "Luigoi",
      symbol: "SMWC",
      copies: 10,
      image: "https://picsum.photos/150",
    },
    {
      name: "Kloev",
      symbol: "SMWC",
      copies: 1,
      image: "https://picsum.photos/150",
    },
    {
      name: "Donkey Kong",
      symbol: "SMWC",
      copies: 1,
      image: "https://picsum.photos/150",
    },
    {
      name: "Mario",
      symbol: "SMWC",
      copies: 10,
      image: "https://picsum.photos/150",
    },
    {
      name: "Luigoi",
      symbol: "SMWC",
      copies: 10,
      image: "https://picsum.photos/150",
    },
    {
      name: "Kloev",
      symbol: "SMWC",
      copies: 1,
      image: "https://picsum.photos/150",
    },
    {
      name: "Donkey Kong",
      symbol: "SMWC",
      copies: 1,
      image: "https://picsum.photos/150",
    },
  ];
  return (
    <div className="App">
      <Container>
        <Title> Super Mario World Collection</Title>
        <Subtitle>The rearest and best of Super Mario World</Subtitle>
        <Grid>
          {nfts.map((nft, i) => (
            <NFTCard nft={nft} key={i} />
          ))}
        </Grid>
      </Container>
    </div>
  );
}

const Title = styled.h1`
  margin: 0;
  text-align: center;
`;

const Subtitle = styled.h4`
  color: gray;
  margin-top: 0;
  text-align: center;
`;

const Container = styled.div`
  width: 70%;
  max-width: 1200px;
  margin: auto;
  margin-top: 100px;
`;

const Grid = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr;
  row-gap: 40px;
`;

export default App;
